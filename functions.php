<?php 
// koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "jadwal");

// Akan menerima parameter String Query di file index
function query($query) {
	global $conn;

	$result = mysqli_query($conn, $query);
	$rows = array();
	while($row = mysqli_fetch_assoc($result) ) {
		array_push($rows,$row);
	}
	return $rows;
}

function menambah_nilai_pengujian($dosen){
	global $conn;
	$q = "UPDATE dosen SET total_menguji = total_menguji+1 WHERE kode_dosen = '".$dosen."'";
	mysqli_query($conn, $q);
}


//Mendapat Nilai Tanggal Dari Hari Ke dan Periode
function get_tanggal($hari, $tgl){
	global $conn;
	$qcek_periode = "SELECT * FROM mahasiswa WHERE periode_sidang != NULL";
	$cek = mysqli_query($conn, $qcek_periode);
	if($hari == null || $tgl == null && mysqli_num_rows($cek) > 0){//jika hari dan tanggal masih kosong
		return "Tidak Mendapatkan Jadwal Dikarenakan Jadwal Dosen Yang Kosong Tidak Menemukan Waktu yang Sama";
	}
	if($hari == null || $tgl == null){//jika hari dan tanggal masih kosong
		return "Belum Mendapatkan Jadwal";
	}	
	else {
		$hari2 = [
			'Mon' => 'Senin',
			'Tue' => 'Selasa',
			'Wed' => 'Rabu',
			'Thu' => 'Kamis',
			'Fri' => "Jum\'at",
		];
		
			return $hari2[date('D', strtotime($tgl."+ ".$hari." days"))];
		}
	}
}

function get_hari($tanggal){// mencari hari untuk di cocokan ke dosen
	if(date('D', strtotime($tanggal)) == 'Sat' || date('D', strtotime($tanggal)) == 'Sun'){//mengecek apakah hari sabtu atau minggu
		return get_hari(date('Y-m-d', strtotime($tanggal."+ 1 days")));//jika tidak, maka akan melakukan recursive dengan tanggal ditambah 1
	}
	$hari = date('D', strtotime($tanggal));//merubah variable tanggal menjadi hari
	return $hari; //mereturn nilai Hari dalam string
}
 
function list_dosen($keahlian){
	global $conn;
	$q = "SELECT * FROM dosen WHERE (keahlian1 = '$keahlian' OR keahlian2 = '$keahlian') AND status='aktif'";
	$run = mysqli_query($conn, $q);
	$str = "";
	foreach($run as $row){
		$str .= "<option value='".$row['kode_dosen']."'>".$row['kode_dosen']."</option>";
	}
	return $str;
}

function tambah($data) {
	global $conn;

	// ambil data dari tiap elemen dalam form
	$nama = htmlspecialchars($data["nama"]);
	$nim = htmlspecialchars($data["nim"]);
	$judul = htmlspecialchars($data["judul"]);
	$pem1 = htmlspecialchars($data["pem1"]);
	$pem2 = htmlspecialchars($data["pem2"]);
	$keahlian = htmlspecialchars($data["keahlian"]);

	// query insert data
	$query = "INSERT INTO mahasiswa (nama,nim,judul,pem1,pem2,keahlian)
				VALUES 
			('$nama', '$nim', '$judul', '$pem1', '$pem2','$keahlian')";

	mysqli_query($conn, $query);

	// mengembalikan agka yang didapat dari mysqli_affected_rows
	return mysqli_affected_rows($conn);
}

//menghapus data sidang berdasarkan id_sidang
function hapus($id) {
	global $conn;

	mysqli_query($conn, "DELETE FROM mahasiswa WHERE id_sidang = $id");
	return mysqli_affected_rows($conn);
}

function ubah($data) {
	global $conn;
	$id = $data["id"];
	//fungsi htmlspecialchars() untuk mencegah karakter html di eksekusi ke browser
	$nama = htmlspecialchars($data["nama"]);
	$nim = htmlspecialchars($data["nim"]);
	$judul = htmlspecialchars($data["judul"]);
	$pem1 = htmlspecialchars($data["pem1"]);
	$pem2 = htmlspecialchars($data["pem2"]);
	// $keahlian = htmlspecialchars($data["keahlian"]);
	$peng1 = htmlspecialchars($data["penguji1"]);
	$peng2 = htmlspecialchars($data["penguji2"]);
	$waktu = htmlspecialchars($data["waktu"]);
	$ruangan = htmlspecialchars($data["ruangan"]);
	$tanggal = htmlspecialchars($data['tanggal']);
	$periode = htmlspecialchars($data['periode']);
	//echo "<script>alert('".$tanggal."');</script>";
	$query = "UPDATE mahasiswa SET 
					nama = '".$nama."',
					nim = '".$nim."',
					judul = '".$judul."',
					pem1 = '".$pem1."',
					pem2 = '".$pem2."',
					penguji1 = '".$peng1."',
					penguji2 = '".$peng2."',
					tanggal = '".$tanggal."',
					waktu = '".$waktu."',
					ruangan = '".$ruangan."'
				WHERE id_sidang = ".$id;
	if(isset($data['submit'])){
		/*$qcek = "SELECT * FROM jadwal WHERE (kode_dosen = '".$pem1."' AND hari = '0".$tanggal."' AND jam_awal LIKE '%".explode(':',explode('-', $waktu)[0])[0]."%') OR (kode_dosen = '".$pem2."' AND hari = '0".$tanggal."' AND jam_awal LIKE '%".explode(':',explode('-', $waktu)[0])[0]."%') OR (kode_dosen = '".$peng1."' AND hari = '0".$tanggal."' AND jam_awal LIKE '%".explode(':',explode('-', $waktu)[0])[0]."%') OR (kode_dosen = '".$peng2."' AND hari = '0".$tanggal."' AND jam_awal LIKE '%".explode(':',explode('-', $waktu)[0])[0]."%')";
		$cek_jadwal = mysqli_query($conn, $qcek);*/
		$test_tanpa_cek = 0; 
		if($test_tanpa_cek == 0){
			$run = mysqli_query($conn, $query);
			if($run){
				return 1;
			}
			else {
				return 0;
			}	
		}
		else {
			return 2;
		}		
			
	}
	else if($_POST['submit_menyesuaikan']){
		$cek = cek_bentrok_sidang($pem1, $pem2, $peng1, explode("-",$waktu)[0],explode('-', $waktu)[1], $tanggal, $conn);
		if($cek[0] == 0 && $cek[1] == 0){
			$cek2 = cek_bentrok_sidang($pem1, $pem2, $peng2, explode("-", $waktu)[0],explode('-', $waktu)[1], $tanggal, $conn);
			if($cek2[0] == 0 && $cek[1] == 0){
				
				$test_tanpa_cek = 0; 
				if($test_tanpa_cek == 0){
					$run = mysqli_query($conn, $query);
					if($run){
						return 1;
					}
					else {
						return 0;
					}	
				}
				else {
					return 2;
				}		
			}
			else {
				return 2;
			}
		}
		else {
			return 2;
		}
	}
	
}

/*function ubah1($data) {
	global $conn;

	$id = $data["id"];
	$nama = htmlspecialchars($data["nama"]);
	$nim = htmlspecialchars($data["nim"]);
	$judul = htmlspecialchars($data["judul"]);
	$pem1 = htmlspecialchars($data["pem1"]);
	$pem2 = htmlspecialchars($data["pem2"]);
	$keahlian = htmlspecialchars($data["keahlian"]);
	$peng1 = htmlspecialchars($data["penguji1"]);
	$peng2 = htmlspecialchars($data["penguji2"]);
	$waktu = htmlspecialchars($data["waktu"]);
	$ruangan = htmlspecialchars($data["ruangan"]);
	$tanggal = htmlspecialchars($data["tanggal"]);

	$query = "UPDATE mahasiswa SET 
				nama = '".$nama."',
				nim = '".$nim."',
				judul = '".$judul."',
				pem1 = '".$pem1."',
				pem2 = '".$pem2."',
				keahlian = '".$keahlian."',
				penguji1 = '".$peng1."',
				penguji2 = '".$peng2."',
				tanggal = '".$tanggal."',
				waktu = '".$waktu."',
				ruangan = '".$ruangan."'
			WHERE id_sidang = ".$id;

	mysqli_query($conn, $query);

	return mysqli_affected_rows($conn);
}*/

//mengecek jadwal yang di generate di halaman generate_tanggal_sidang untuk mencegah data yang bentrok
function cek_bentrok_sidang($pem1, $pem2, $kode_dosen, $jam_awal,$jam_akhir, $hari, $conn){
	$jam = substr($jam_awal, 0,2);// mengambil 2 string awal dari jam
	$q = "SELECT * FROM mahasiswa WHERE waktu LIKE '".$jam."%' AND tanggal = '".$hari."' AND (pem1='".$kode_dosen."' OR pem2='".$kode_dosen."' OR penguji1='".$kode_dosen."' OR penguji2='".$kode_dosen."' OR pem1='".$pem1."' OR pem2='".$pem2."')";
	$runcek1 = mysqli_query($conn, $q); // mengecek apakah ada nama dosen yang sudah berada dalam 1 kolom untuk mencegah dosen sama menjadi penguji 1 dan 2

	$q2 = "SELECT * FROM jadwal WHERE kode_dosen = '".$kode_dosen."' AND (jam_awal BETWEEN '".$jam.":30"."' AND '".($jam+2).":30"."') AND hari = '0".$hari."'";
	$runcek2 = mysqli_query($conn, $q2);

	// mengecek apakah dosen yang di cek memiliki waktu kosong selain pada jam yang di cocokan

	
	return [mysqli_num_rows($runcek1), mysqli_num_rows($runcek2)];
}

//Generate Tanpa Jadwal Dosen
function cek_jadwal_sidang($pem1, $pem2, $kode_dosen, $jam_awal,$jam_akhir, $hari, $conn){
	$jam = substr($jam_awal, 0,2);// mengambil 2 string awal dari jam
	$q = "SELECT * FROM mahasiswa WHERE waktu LIKE '".$jam."%' AND tanggal = '".$hari."' AND (pem1='".$kode_dosen."' OR pem2='".$kode_dosen."' OR penguji1='".$kode_dosen."' OR penguji2='".$kode_dosen."' OR pem1='".$pem1."' OR pem2='".$pem2."')";
	$runcek1 = mysqli_query($conn, $q); // mengecek apakah ada nama dosen yang sudah berada dalam 1 kolom untuk mencegah dosen sama menjadi penguji 1 dan 2
		
	return [mysqli_num_rows($runcek1), $total];
}


function tambah_dosen($data) {
	global $conn;

	$kode_dosen = strtoupper(stripslashes($data["kode_dosen"]));
	//fungsi mysqli_real_escape_string() untuk mencegah user menginputkan perintah SQL ke database
	$keahlian1 = mysqli_real_escape_string($conn, $data["keahlian1"]);
	$keahlian2 = mysqli_real_escape_string($conn, $data["keahlian2"]);

	// cek apakah kode dosen sudah ada atau belum
	$result = mysqli_query($conn, "SELECT * FROM dosen WHERE kode_dosen = '$kode_dosen' ");
	if(mysqli_fetch_assoc($result)) {
		echo "<script>
			alert ('Kode Dosen Sudah Ada !');
			</script>
		";
		return false;
	}

	
	// Tambahkan userbaru ke database
	mysqli_query($conn, "INSERT INTO dosen (kode_dosen,keahlian1,keahlian2) VALUES('$kode_dosen','$keahlian1','$keahlian2')");
	return mysqli_affected_rows($conn);
}

//menghapus dosen
function hapus_dosen($id) {
	global $conn;

	mysqli_query($conn, "DELETE FROM dosen WHERE id = $id");
	return mysqli_affected_rows($conn);
}

function cek_ruangan($jam, $hari, $ruangan){
	                global $conn;
	                $qcek = "SELECT * FROM mahasiswa WHERE ruangan = '".$ruangan."' AND tanggal = '".$hari."' AND waktu='".$jam."'";
	                $runcek = mysqli_query($conn, $qcek);
	                return mysqli_num_rows($runcek);
	            }


?>
