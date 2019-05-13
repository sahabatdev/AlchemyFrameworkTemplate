<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="wrap_content"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    android:layout_gravity="center"
    android:gravity="center">

    <ImageView
        android:layout_width="@dimen/_230sdp"
        android:layout_height="@dimen/_230sdp"
        android:background="@mipmap/ic_launcher"
        />

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="${activityClass} App"
        android:layout_marginTop="@dimen/_8sdp"
        android:textSize="@dimen/_20sdp"
        android:textColor="@android:color/black"
        android:textStyle="bold"/>

    <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Versi 1.0.0"/>

</LinearLayout>