package ${packageName}.model.${activityPackage};

public class ${activityClass}Request {
    String nama;
    String email;
    String password;
    String nomorHp;
    String tanggalLahir;
    String jenisKelamin;
    String agama;

    public FormRequest(String nama, String email, String password, String nomorHp, String tanggalLahir, String jenisKelamin, String agama) {
        this.nama = nama;
        this.email = email;
        this.password = password;
        this.nomorHp = nomorHp;
        this.tanggalLahir = tanggalLahir;
        this.jenisKelamin = jenisKelamin;
        this.agama = agama;
    }
}