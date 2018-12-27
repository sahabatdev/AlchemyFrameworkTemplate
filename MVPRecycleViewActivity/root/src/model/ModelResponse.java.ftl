package ${packageName}.model.${activityPackage};
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ${activityClass}Response {
    @Expose
    @SerializedName("title")
    private String title;
    @Expose
    @SerializedName("description")
    private String description;

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }
}