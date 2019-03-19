package ${packageName}.module.${activityPackage};

import site.sahabatdeveloper.sahabatlibrary.base.BaseView;

<#if useApi>
import ${packageName}.model.${activityPackage}.${activityClass}Response;
</#if>

public interface ${activityClass}View extends BaseView {
    <#if useApi>
    public void onSuccess${activityClass}(${activityClass}Response response);
    </#if>
    //TODO Add Your Abstract Method for View Your App
}