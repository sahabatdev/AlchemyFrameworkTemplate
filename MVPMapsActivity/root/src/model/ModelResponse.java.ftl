package ${packageName}.model.${activityPackage};

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ${activityClass}Response {
    @Expose
    @SerializedName("id")
    private int id;
    @Expose
    @SerializedName("nama")
    private String nama;
    @Expose
    @SerializedName("latitude")
    private String latitude;
    @Expose
    @SerializedName("longitude")
    private String longitude;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }


}