<?xml version="1.0"?>

<recipe>
    <#include "recipe_manifest.xml.ftl" />

<copy from="root/res-buildApi22/drawable"
            to="${escapeXmlAttribute(resOut)}/drawable" />
    <copy from="root/res-buildApi22/drawable-v21"
            to="${escapeXmlAttribute(resOut)}/drawable<#if includeImageDrawables>-v21</#if>" />

    <#if includeImageDrawables>
        <copy from="root/res-buildApi22/values/drawables.xml"
                to="${escapeXmlAttribute(resOut)}/values/drawables.xml" />
    </#if>

    <#if !(hasDependency('com.android.support:design'))>
        <dependency mavenUrl="com.android.support:design:${buildApi}.+"/>
    </#if>

    <#if !(hasDependency('com.android.support:appcompat-v7'))>
        <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
    </#if>

    <#include "../common/recipe_simple.xml.ftl" />

    <#if hasAppBar>
        <#include "../common/recipe_app_bar.xml.ftl" />
    <#else>
        <#include "../common/recipe_no_actionbar.xml.ftl" />
    </#if>
    <#if buildApi gte 21>
        <instantiate from="root/res-buildApi22/values-v21/no_actionbar_styles_v21.xml.ftl"
                        to="${escapeXmlAttribute(resOut)}/values-v21/styles.xml" />
    </#if>

    <instantiate from="root/res-buildApi22/menu/drawer.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/menu/${drawerMenu}.xml" />

    <instantiate from="root/res-buildApi22/layout/navigation_view.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
    <instantiate from="root/res-buildApi22/layout/navigation_header.xml.ftl"
                   to="${escapeXmlAttribute(resOut)}/layout/${navHeaderLayoutName}.xml" />


    <instantiate from="root/src-buildApi22/app_package/DrawerActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java}" />

    <open file="${escapeXmlAttribute(srcOut)}/module/${activityPackage}/${activityClass}Activity.java" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />

</recipe>
