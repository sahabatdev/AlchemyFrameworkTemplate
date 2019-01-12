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
    @Expose
    @SerializedName("urlImage")
    private String urlImage;
    <#if isClick>
    @Expose
    @SerializedName("detail")
    private String detail;
    </#if>

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getUrlImage() {
        return urlImage;
    }

    <#if isClick>
    public String getDetail() {
        return detail;
    }
    </#if>
}