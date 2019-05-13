package ${packageName}.module.${activityPackage};

import java.util.List;
import site.sahabatdeveloper.sahabatlibrary.base.BaseView;

<#if useApi>
import ${packageName}.model.${activityPackage}.${activityClass}Response;
</#if>

public interface ${activityClass}View extends BaseView {
    <#if useApi>
    public void onSuccess${activityClass}(List<${activityClass}Response> response);

    <#if isClick>
    public void onClickItem(${activityClass}Response response);
    </#if>
    </#if>
    //TODO Add Your Abstract Method for View Your App
}