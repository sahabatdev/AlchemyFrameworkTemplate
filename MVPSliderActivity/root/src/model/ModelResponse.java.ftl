package ${packageName}.model.${activityPackage};

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ${activityClass}Response {
    @Expose
    @SerializedName("id")
    private int id;
    @Expose
    @SerializedName("deskripsi")
    private String deskripsi;
    @Expose
    @SerializedName("image")
    private String image;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeskripsi() {
        return deskripsi;
    }

    public void setDeskripsi(String deskripsi) {
        this.deskripsi = deskripsi;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}