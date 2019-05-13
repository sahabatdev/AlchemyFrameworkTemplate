<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="@dimen/_8sdp"
    android:orientation="vertical">

    <android.support.design.widget.TextInputLayout
        android:id="@+id/layout_nama_lengkap"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">

        <android.support.design.widget.TextInputEditText
            android:id="@+id/et_nama_lengkap"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:inputType="textPersonName"
            android:hint="Nama Lengkap"
            />

    </android.support.design.widget.TextInputLayout>

    <android.support.design.widget.TextInputLayout
        android:id="@+id/layout_email"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">

        <android.support.design.widget.TextInputEditText
            android:id="@+id/et_email"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:inputType="textEmailAddress"
            android:hint="Email"
            />

    </android.support.design.widget.TextInputLayout>

    <android.support.design.widget.TextInputLayout
        android:id="@+id/layout_nomor_hp"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">

        <android.support.design.widget.TextInputEditText
            android:id="@+id/et_nomor_hp"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:hint="Nomor Handphone"
            />

    </android.support.design.widget.TextInputLayout>

    <android.support.design.widget.TextInputLayout
        android:id="@+id/layout_password"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        app:passwordToggleEnabled="true">

        <android.support.design.widget.TextInputEditText
            android:id="@+id/et_password"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:inputType="textPassword"
            android:hint="Kata Sandi"
            />

    </android.support.design.widget.TextInputLayout>

    <android.support.design.widget.TextInputLayout
        android:id="@+id/layout_tanggal_lahir"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        app:passwordToggleEnabled="true">

        <android.support.design.widget.TextInputEditText
            android:id="@+id/et_tanggal_lahir"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:clickable="true"
            android:focusable="false"
            android:hint="Tanggal Lahir"
            />

    </android.support.design.widget.TextInputLayout>

    <TextView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Jenis Kelamin"
        android:textSize="@dimen/_13sdp"
        android:layout_margin="@dimen/_2sdp"
        android:layout_marginTop="@dimen/_10sdp"/>

   <RadioGroup
       android:id="@+id/radio_group"
       android:layout_width="match_parent"
       android:layout_height="wrap_content">

       <RadioButton
           android:id="@+id/radio_laki_laki"
           android:layout_width="match_parent"
           android:layout_height="wrap_content"
           android:checked="true"
           android:text="Laki - laki"/>

       <RadioButton
           android:id="@+id/radio_permpuan"
           android:layout_width="match_parent"
           android:layout_height="wrap_content"
           android:text="Perempuan"/>

   </RadioGroup>

    <TextView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Agama"
        android:textSize="@dimen/_13sdp"
        android:layout_margin="@dimen/_2sdp"
        android:layout_marginTop="@dimen/_10sdp"/>

    <Spinner
        android:id="@+id/spn_agama"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">

    </Spinner>

    <Button
        android:id="@+id/btn_submit"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:layout_marginTop="@dimen/_10sdp"
        android:backgroundTint="@color/colorPrimary"
        android:text="SUBMIT"
        android:textColor="@android:color/white"/>

</LinearLayout>