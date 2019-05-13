<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/linear_item_${activityPackage}"
    android:layout_width="150dp"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    android:layout_margin="5dp"
    android:padding="10dp">

    <ImageView
        android:id="@+id/img_item_${activityPackage}"
        android:layout_width="100dp"
        android:layout_height="100dp"
        android:layout_gravity="center_horizontal"
        android:layout_marginBottom="8dp"/>

    <TextView
        android:id="@+id/tv_title"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="BARANG"
        android:textAlignment="center"
        android:textColor="@android:color/black"
        android:textSize="15dp"
        android:textStyle="bold" />

    <TextView
        android:id="@+id/tv_deskripsi"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="sdsdsdsdsd sdsdsds sdsdsd" />

</LinearLayout>