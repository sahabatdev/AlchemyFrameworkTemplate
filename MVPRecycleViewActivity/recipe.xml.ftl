<?xml version="1.0"?>

<recipe>
    <#include "recipe_manifest.xml.ftl" />

    <instantiate from="root/src/app_package/MVPActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <instantiate from="root/src/app_package/MVPPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Presenter.java" />
    <instantiate from="root/src/app_package/MVPView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}View.java" />
    <instantiate from="root/src/app_package/MVPAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Adapter.java" />

    <instantiate from="root/src/model/ModelRequest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/model/${activityPackage}/${activityClass}Request.java" />
    <instantiate from="root/src/model/ModelResponse.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/model/${activityPackage}/${activityClass}Response.java" />



    <instantiate from="root/res/layout/activity_mvp.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
    <instantiate from="root/res/layout/item_list_mvp.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/item_list_${activityPackage}.xml" />

    <open file="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

</recipe>
