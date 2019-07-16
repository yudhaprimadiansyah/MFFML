<?php

require "functions.php";
//mengecek apakah jadwal dosen sudah tersedia
$qcek = "SELECT * FROM jadwal";
$qrun = mysqli_query($conn, $qcek);

$qcek2 = "SELECT * FROM mahasiswa";
$qrun2 = mysqli_query($conn, $qcek2);

if(isset($_POST["generate_dengan_jadwal"])) {
	if(mysqli_num_rows($qrun2) > 0 && mysqli_num_rows($qrun) > 0){
		//mengosongkan ulang nilai penguji1,penguji2,waktu dan tanggal supaya dapat menyesuaikan keseluruhan data tanpa bentrok
				mysqli_query($conn, "UPDATE mahasiswa SET penguji1=NULL,penguji2=NULL,waktu=NULL,tanggal=NULL");
				mysqli_query($conn, "UPDATE dosen SET total_menguji=0");
				if(isset($_POST['tanggal_mulai'])){
					$tanggal_mulai = $_POST['tanggal_mulai'];
					$jam = ["08:00", "10:00", "13:00", "15:00"]; // jam mutlak sidang
					$day = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri']; //list hari untuk diambil index nya sebagai hari ke-x sidang
					$hari = [// [1,2,3,4,5,6]
							//memanggil query get_hari difunctions.php untuk mendapatkan hari yang diambil dari tanggal, lalu hasil hari tadi dirubah ke angka dengan mengambil index dari $day
							//fungsi array_search($string) untuk mengambil index dari data dalam array
							array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 0 days"))),$day)+1,
							array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 1 days"))),$day)+1,
							array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 2 days"))),$day)+1,
							array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 3 days"))),$day)+1,
							array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 4 days"))),$day)+1,
					]; // hari mutlak sidang
					
					$q_sidang = "SELECT id_sidang,keahlian,pem1,pem2,penguji1,penguji2,nama FROM mahasiswa";
	            $run_sidang = mysqli_query($conn, $q_sidang);// mengambil data sidang mahasiswa yang tersedia
					foreach($run_sidang as $row){ // tiap data sidang diambil untuk di proses 1 per satu
						$qcek_keahlian_dosen = "SELECT kode_dosen FROM dosen WHERE (keahlian1 = '".$row['keahlian']."' OR keahlian2 = '".$row['keahlian']."') AND kode_dosen != '".$row['pem1']."' AND kode_dosen != '".$row['pem2']."' AND kode_dosen != 'PRAK' AND status='aktif' AND total_menguji = (SELECT MIN(total_menguji) FROM dosen WHERE (keahlian1='".$row['keahlian']."' OR keahlian2='".$row['keahlian']."') AND status='aktif')";
						$dosen_cocok = mysqli_query($conn, $qcek_keahlian_dosen);
						$found = 0;
							foreach($dosen_cocok as $dosen){
								if($found > 0){
									break;
								}
								foreach($hari as $day){
									if($found > 0){
										break;
									}
									foreach($jam as $j){
										//echo $j."-".(substr($j, 0,2)+2).":00"."<br>";
										if($found > 0){
											break;
										}	
										$cek1 = cek_bentrok_sidang($row['pem1'], $row['pem2'], $dosen['kode_dosen'], $j,(substr($j, 0,2)+2).":00", $day, $conn);
										if($cek1[0] == 0 && $cek1[1] == 0){
											$dosen_1 = $dosen['kode_dosen'];
											menambah_nilai_pengujian($dosen['kode_dosen']);
											$qcek_keahlian_dosen2 = "SELECT kode_dosen FROM dosen WHERE kode_dosen != '".$dosen_1."' AND  (keahlian1 = '".$row['keahlian']."' OR keahlian2 = '".$row['keahlian']."') AND kode_dosen != '".$row['pem1']."' AND kode_dosen != '".$row['pem2']."' AND kode_dosen != 'PRAK' AND status='aktif' AND total_menguji = (SELECT MIN(total_menguji) FROM dosen WHERE (keahlian1='".$row['keahlian']."' OR keahlian2='".$row['keahlian']."') AND status='aktif' AND kode_dosen != '".$dosen_1."')";
											$dosen_cocok2 = mysqli_query($conn, $qcek_keahlian_dosen2);
											foreach($dosen_cocok2 as $dosen2){
												$cek2 = cek_bentrok_sidang($row['pem1'], $row['pem2'], $dosen2['kode_dosen'], $j,(substr($j, 0,2)+2).":00", $day, $conn);
												if($cek2[0] == 0 && $cek2[1] == 0){
													
													$q = "UPDATE mahasiswa SET ruangan='Ruang Sidang',penguji1='".$dosen['kode_dosen']."', penguji2='".$dosen2['kode_dosen']."', tanggal='".$day."', waktu='".$j."-".(substr($j,0,2)+2).":00', periode_sidang = '".$tanggal_mulai."' WHERE id_sidang=".$row['id_sidang'];
													
													menambah_nilai_pengujian($dosen2['kode_dosen']);
													$run = mysqli_query($conn, $q);
	                                                if($run){
	                                                	$found = 1;
	                                                	break;
	                                                }
	                                                else {
	                                                	continue;	
	                                                }
												}
												else {
													continue;
												}
											}
										}
										else {
											continue;
										}
									}
								}
							}
					}
					
					echo "<script>alert('Generate Jadwal Berhasil');document.location.href='index.php';</script>";
					
				}
				else {
					echo "<script>alert('Tanggal Tidak Boleh Kosong');document.location.href='index.php';</script>";
				}
	
		}
		else {
			echo "<script>alert('Pastikan Data Mahasiswa Dan Jadwal Dosen Sudah Tersedia');document.location.href='index.php';</script>";
		}
}

if(isset($_POST["generate_tanpa_jadwal"])) {
		if(mysqli_num_rows($qrun2) > 0){
	//mengosongkan ulang nilai penguji1,penguji2,waktu dan tanggal supaya dapat menyesuaikan keseluruhan data tanpa bentrok
	        mysqli_query($conn, "UPDATE mahasiswa SET penguji1=NULL,penguji2=NULL,waktu=NULL,tanggal=NULL");
			mysqli_query($conn, "UPDATE dosen SET total_menguji=0");
	        if(isset($_POST['tanggal_mulai'])){
	            $tanggal_mulai = $_POST['tanggal_mulai'];
	            $jam = ["08:00", "10:00", "13:00", "15:00"]; // jam mutlak sidang
	            $day = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']; //list hari untuk diambil index nya sebagai hari ke-x sidang
	            $hari = [
	                    //memanggil query get_hari difunctions.php untuk mendapatkan hari yang diambil dari tanggal, lalu hasil hari tadi dirubah ke angka dengan mengambil index dari $day
	                    //fungsi array_search($string) untuk mengambil index dari data dalam array
	                    array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 0 days"))),$day)+1,
	                    array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 1 days"))),$day)+1,
	                    array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 2 days"))),$day)+1,
	                    array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 3 days"))),$day)+1,
	                    array_search(get_hari(date('Y-m-d', strtotime($tanggal_mulai."+ 4 days"))),$day)+1,
	            ]; // hari mutlak sidang
	            
	            $q_sidang = "SELECT id_sidang,keahlian,pem1,pem2,penguji1,penguji2,nama FROM mahasiswa";
	            $run_sidang = mysqli_query($conn, $q_sidang);// mengambil data sidang mahasiswa yang tersedia
					foreach($run_sidang as $row){ // tiap data sidang diambil untuk di proses 1 per satu
						$qcek_keahlian_dosen = "SELECT kode_dosen FROM dosen WHERE (keahlian1 = '".$row['keahlian']."' OR keahlian2 = '".$row['keahlian']."') AND kode_dosen != '".$row['pem1']."' AND kode_dosen != '".$row['pem2']."' AND kode_dosen != 'PRAK' AND status='aktif' AND total_menguji = (SELECT MIN(total_menguji) FROM dosen WHERE (keahlian1='".$row['keahlian']."' OR keahlian2='".$row['keahlian']."') AND status='aktif')";
						$dosen_cocok = mysqli_query($conn, $qcek_keahlian_dosen);
						$found = 0;
							foreach($dosen_cocok as $dosen){
								if($found > 0){
									break;
								}
								foreach($hari as $day){
									if($found > 0){
										break;
									}
									foreach($jam as $j){
										if($found > 0){
											break;
										}	
										$cek1 = cek_jadwal_sidang($row['pem1'], $row['pem2'], $dosen['kode_dosen'], $j,(substr($j, 0,2)+2).":00", $day, $conn);
										if($cek1[0] == 0){
											$dosen_1 = $dosen['kode_dosen'];
											menambah_nilai_pengujian($dosen['kode_dosen']);
											$qcek_keahlian_dosen2 = "SELECT kode_dosen FROM dosen WHERE kode_dosen != '".$dosen_1."' AND  (keahlian1 = '".$row['keahlian']."' OR keahlian2 = '".$row['keahlian']."') AND kode_dosen != '".$row['pem1']."' AND kode_dosen != '".$row['pem2']."' AND kode_dosen != 'PRAK' AND status='aktif' AND total_menguji = (SELECT MIN(total_menguji) FROM dosen WHERE (keahlian1='".$row['keahlian']."' OR keahlian2='".$row['keahlian']."') AND status='aktif' AND kode_dosen != '".$dosen_1."')";
											$dosen_cocok2 = mysqli_query($conn, $qcek_keahlian_dosen2);
											foreach($dosen_cocok2 as $dosen2){
												$cek2 = cek_jadwal_sidang($row['pem1'], $row['pem2'], $dosen2['kode_dosen'], $j,(substr($j, 0,2)+2).":00", $day, $conn);
												if($cek2[0] == 0){
													
													$q = "UPDATE mahasiswa SET ruangan='Ruang Sidang',penguji1='".$dosen['kode_dosen']."', penguji2='".$dosen2['kode_dosen']."', tanggal='".$day."', waktu='".$j."-".(substr($j,0,2)+2).":00', periode_sidang = '".$tanggal_mulai."' WHERE id_sidang=".$row['id_sidang'];
													
													menambah_nilai_pengujian($dosen2['kode_dosen']);
													$run = mysqli_query($conn, $q);
	                                                if($run){
	                                                	$found = 1;
	                                                	break;
	                                                }
	                                                else {
	                                                	continue;	
	                                                }
												}
												else {
													continue;
												}
											}
										}
										else {
											continue;
										}
									}
								}
							}
					}
	          echo "<script>alert('Generate Jadwal Berhasil');document.location.href='index.php';</script>";
	            
	        }
	        else {
	            echo "<script>alert('Tanggal Tidak Boleh Kosong');document.location.href='index.php';</script>";
	        }

	}

	else {
	    echo "<script>alert('Pastikan Data Sidang Mahasiswa Sudah Terinput');window.location.href='index.php';</script>";
	}
}

?>