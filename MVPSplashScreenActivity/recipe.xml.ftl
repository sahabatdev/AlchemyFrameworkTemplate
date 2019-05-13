<?xml version="1.0"?>

<recipe>
    <#include "recipe_manifest.xml.ftl" />

    <instantiate from="root/src/app_package/MVPActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <instantiate from="root/src/app_package/MVPPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Presenter.java" />
    <instantiate from="root/src/app_package/MVPView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}View.java" />

    <instantiate from="root/res/layout/activity_mvp.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

    <open file="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

</recipe>
