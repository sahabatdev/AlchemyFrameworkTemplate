<?xml version="1.0"?>

<recipe>
    <#include "recipe_manifest.xml.ftl" />

    <instantiate from="root/src/app_package/MVPActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <instantiate from="root/src/app_package/MVPPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Presenter.java" />
    <instantiate from="root/src/app_package/MVPView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}View.java" />
    <#if useApi>
    <instantiate from="root/src/model/ModelResponse.java.ftl"
                  to="${escapeXmlAttribute(srcOut)}/model/${activityPackage}/${activityClass}Response.java" />
    <#if method == 'post' || method == 'put'>
    <instantiate from="root/src/model/ModelRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/model/${activityPackage}/${activityClass}Request.java" />
    </#if>
    </#if>

    <#if tipeLayout == 'empty'>
    <instantiate from="root/res/layout/activity_mvp.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    </#if>
    <#if tipeLayout == 'detail'>
    <instantiate from="root/res/layout/activity_detail_mvp.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    </#if>

    <open file="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

</recipe>
