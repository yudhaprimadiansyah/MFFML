<?php

require_once "functions.php";


/*$q_kode_dosen = "SELECT kode_dosen FROM jadwal_dosen GROUP BY kode_dosen"; //query ambil kode dosen
$run = mysqli_query($conn, $q_kode_dosen);*/

/*$q_keahlian = "SELECT keahlian1,keahlian2,kode_dosen from dosen JOIN jadwal_dosen ON jadwal_dosen.kode_dosen = dosen.kode_dosen GROUP BY kode_dosen";
$run_keah = mysqli_query($conn, $q_keahlian);


$q2 = "SELECT * FROM jadwal_dosen ORDER BY kode_dosen";
/*$kode_dosen = array();
foreach($run as $row){
    array_push($kode_dosen, $row['kode_dosen']);
}*/

/*print_r($kode_dosen);

$keahlian = array();
foreach($run_keah as $row_keah)
{
    array_push($keahlian, $row_keah['keahlian1']);
}

print_r($keahlian);*/

function cek_bentrok_sidang($kode_dosen, $jam_awal,$jam_akhir, $hari, $conn){
    $jam = substr($jam_awal, 0,2);// mengambil 2 string awal dari jam
    $q = "SELECT * FROM mahasiswa WHERE waktu LIKE '".$jam."%' AND tanggal = '".$hari."' AND (pem1='".$kode_dosen."' OR pem2='".$kode_dosen."' OR penguji1='".$kode_dosen."' OR penguji2='".$kode_dosen."')";
    $runcek1 = mysqli_query($conn, $q); // mengecek apakah ada nama dosen yang sudah berada dalam 1 kolom untuk mencegah dosen sama menjadi penguji 1 dan 2

    $q2 = "SELECT * FROM jadwal_dosen WHERE kode_dosen = '".$kode_dosen."' AND (jam_awal BETWEEN '".$jam_awal."' AND '".$jam_akhir."') AND tanggal = '".$hari."'";
    $runcek2 = mysqli_query($conn, $q2); // mengecek apakah dosen yang di cek memiliki waktu kosong selain pada jam yang di cocokan
    return [mysqli_num_rows($runcek1), mysqli_num_rows($runcek1)];
}

$jam = ["08:00", "10:00", "12:00", "14:00", "16:00"]; // jam mutlak sidang

$hari = ["01","02","03","04","05","06"]; // hari mutlak sidang

$q_sidang = "SELECT id_sidang,keahlian,pem1,pem2,penguji1,penguji2 FROM mahasiswa";
$run_sidang = mysqli_query($conn, $q_sidang);// mengambil data sidang mahasiswa yang tersedia
//$found = 0;
foreach($run_sidang as $row){ // tiap sidang di iterasi untuk di proses 1 per satu

    $found = 0; // flag pengecekan, apakah sudah ditemukan untuk sidang yang di cek ini, jika di temukan kecocokan, maka nilai flagnya 2
    
    $qcek_keahlian_dosen = "SELECT kode_dosen FROM dosen WHERE keahlian1 = '".$row['keahlian']."' OR keahlian2 = '".$row['keahlian']."' AND (kode_dosen != '".$row['pem1']."' AND kode_dosen != '".$row['pem2']."')";
    $dosen_cocok = mysqli_query($conn, $qcek_keahlian_dosen);// mencocokan dosen dengan keahlian PA mahasiswa
    foreach($dosen_cocok as $dosen){//mengiterasi setiap dosen, untuk dicari kecocokan waktu dan ketersediaan slot penguji suatu sidang
        if($found == 2){
            break;
        }
        for($i=0;$i<sizeof($hari);$i++){//mengiterasi array hari yang mutlak untuk jadwal sidang
            if($found == 2){
                break;
            }
            for($j=0;$j<sizeof($jam);$j++){
                if($found == 2){
                    break;
                }
                $test = cek_bentrok_sidang($dosen['kode_dosen'], $jam[$j],((substr($jam[$j],0,2)+2).":00"), $hari[$i], $conn); //melakukan pengecekan kandidat dosen penguji satu apakah terdapat slot kosong pada hari dan jam yg ditetapkan
                print_r($test)."<br>";//debugging
                if($test[0] == 0 && $test[1] == 0){// jika kandidat dosen penguji 1 tidak memiliki jadwal bentrok dengan jadwal sidang lain dan jadwal mengajarnya, maka kode didalam sini di eksekusi
                    $found += 1; //flag found di tambah 1;
                    if($row['penguji1'] == NULL){//jika isi penguji1 masih kosong maka
                        foreach($dosen_cocok as $dosen2){//malkukan iterasi untuk mencari dosen yang cocok sebagai penguji ke 2;
                            if($found == 2){
                                break;
                            }
                            $test = cek_bentrok_sidang($dosen2['kode_dosen'], $jam[$j],((substr($jam[$j],0,2)+2).":00"), $hari[$i], $conn);
                            if($test[0] == 0 && $test[1] == 0){
                                if($row['penguji2'] == NULL && $dosen['kode_dosen'] != $dosen2['kode_dosen']){
                                    $found += 1;
                                    $q = "UPDATE mahasiswa SET penguji1='".$dosen['kode_dosen']."', penguji2='".$dosen2['kode_dosen']."', tanggal='".$hari[$i]."', waktu='".$jam[$j]."' WHERE id_sidang=".$row['id_sidang'];
                                    mysqli_query($conn, $q);
                                    echo "Jadwal Untuk ID SIDANG : ".$row['id_sidang']." Dengan Keahlian : ".$row['keahlian']." Mendapatkan Jadwal Sidang Pukul ".$jam[$j]."<br>";
                                }
                                if($found == 2){
                                    break;
                                }
                            }
                        }
                    }
                    
                    
                }
            }
        }
    }
}



/*foreach($run as $row){
    for($i=0;$i<sizeof($jam);$i++){
        if(substr($row['jam_awal'], 0,2) < substr($jam[$i], 0, 2) && substr($row['jam_akhir'], 0,2) < substr($jam[$i], 0, 2)){
            echo "Dosen Dengan Kode : ".$row['kode_dosen']." Memiliki Jam Kosong Di Hari : ".($row['hari'])." Jam : ".$jam[$i]."<br>";
            echo "jam_awal : ".substr($row['jam_awal'], 0, 2)."<br>";
            echo "Jam_ambil : ".substr($jam[$i], 0, 2)."<br>";
            echo "jam_akhir : ".substr($row['jam_akhir'], 0, 2)."<br>";
            echo "Jam_ambil : ".substr($jam[$i], 0, 2)."<br>";
        }
    }
}*/

/*$q_get_jadwal = "SELECT * FROM mahasiswa";
$run2 = mysqli_query($conn, $q_get_jadwal);
foreach($run as $row){
    $hari = $row['hari'];
    foreach($run2 as $row2){
        $jam = "";
        for($i=0;i<sizeof($jam);$i++){
            if($jam[$i] != $row['jam_awal']){
                    $jam = $jam[$i];
                    break;
            }
        }
        if($row2['pem1'] != $row['kode_dosen'] && $row2['pem2'] != $row['kode_dosen']){
            $q_update = "UPDATE mahasiswa SET penguji1 = '".$row['kode_dosen']."',
             tanggal='".$row['hari']."', waktu='".$jam."' WHERE id_sidang = ".$row2['id_sidang'];
             mysqli_query($conn, $q_update);
            break;
        }
        if($row2['pem1'] != $row['kode_dosen'] && $row2['pem2'] != $row['kode_dosen'] && $row2['penguji1'] != $row['kode_dosen']){
            $q_update = "UPDATE mahasiswa SET penguji2 = '".$row['kode_dosen']."' WHERE id_sidang = ".$row2['id_sidang']; 
        }
            
    }
    
}*/

//print_r($jadwal);



?>