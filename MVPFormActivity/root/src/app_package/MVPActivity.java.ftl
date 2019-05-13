package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;
<#if isToolbarBack>
import android.view.MenuItem;
</#if>
<#if useApi>
<#if auth != 'no'>
import android.util.Base64;
</#if>
import android.util.Log;
import site.sahabatdeveloper.sahabatlibrary.helper.SahabatHelper;
import ${packageName}.model.${activityPackage}.${activityClass}Response;
import ${packageName}.model.${activityPackage}.${activityClass}Request;
</#if>
import android.app.DatePickerDialog;
import android.support.design.widget.TextInputEditText;
import android.support.design.widget.TextInputLayout;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Spinner;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    ${activityClass}Presenter mPresenter;
    private TextInputLayout layoutNamaLengkap, layoutEmail, layoutNomorHp, layoutPassword, layoutTanggalLahir;
    private TextInputEditText etNamaLengkap, etEmail, etNomorHp, etPassword, etTanggalLahir;
    private RadioGroup radioGroupJenisKelamin;
    private Button btnSubmit;
    private Spinner spnAgama;
    private Calendar myCalendar;
    private RadioButton radioButtonJenisKelamin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        getSupportActionBar().setTitle("${activityClass}");

        <#if isToolbarBack>
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        </#if>

        mPresenter = new ${activityClass}Presenter(this);

        layoutNamaLengkap = findViewById(R.id.layout_nama_lengkap);
        layoutEmail = findViewById(R.id.layout_email);
        layoutNomorHp = findViewById(R.id.layout_nomor_hp);
        layoutPassword = findViewById(R.id.layout_password);
        layoutTanggalLahir = findViewById(R.id.layout_tanggal_lahir);
        etNamaLengkap = findViewById(R.id.et_nama_lengkap);
        etEmail = findViewById(R.id.et_email);
        etNomorHp = findViewById(R.id.et_nomor_hp);
        etPassword = findViewById(R.id.et_password);
        etTanggalLahir = findViewById(R.id.et_tanggal_lahir);
        radioGroupJenisKelamin = findViewById(R.id.radio_group);
        spnAgama = findViewById(R.id.spn_agama);
        btnSubmit = findViewById(R.id.btn_submit);

        etNamaLengkap.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                layoutNamaLengkap.setErrorEnabled(false);
            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        etEmail.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                layoutEmail.setErrorEnabled(false);
            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        etNomorHp.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                layoutNomorHp.setErrorEnabled(false);
            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        etPassword.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                layoutPassword.setErrorEnabled(false);
            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        etTanggalLahir.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int i, int i1, int i2) {
                layoutTanggalLahir.setErrorEnabled(false);
            }

            @Override
            public void onTextChanged(CharSequence charSequence, int i, int i1, int i2) {

            }

            @Override
            public void afterTextChanged(Editable editable) {

            }
        });

        myCalendar = Calendar.getInstance();

        final DatePickerDialog.OnDateSetListener date = new DatePickerDialog.OnDateSetListener() {
            @Override
            public void onDateSet(DatePicker view, int year, int monthOfYear,
                                  int dayOfMonth) {
                myCalendar.set(Calendar.YEAR, year);
                myCalendar.set(Calendar.MONTH, monthOfYear);
                myCalendar.set(Calendar.DAY_OF_MONTH, dayOfMonth);
                updateLabel();
            }
        };

        etTanggalLahir.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new DatePickerDialog(${activityClass}Activity.this, date, myCalendar
                        .get(Calendar.YEAR), myCalendar.get(Calendar.MONTH),
                        myCalendar.get(Calendar.DAY_OF_MONTH)).show();
            }
        });

        List<String> listAgama = new ArrayList<>();
        listAgama.add("ISLAM");
        listAgama.add("KATOLIK");
        listAgama.add("KRISTEN");
        listAgama.add("HINDU");
        listAgama.add("BUDHA");
        listAgama.add("KONGHUCU");
        spnAgama.setAdapter(new ArrayAdapter<String>(this,android.R.layout.simple_list_item_1,listAgama));

        btnSubmit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                layoutNamaLengkap.setErrorEnabled(true);
                layoutEmail.setErrorEnabled(true);
                layoutNomorHp.setErrorEnabled(true);
                layoutPassword.setErrorEnabled(true);
                layoutTanggalLahir.setErrorEnabled(true);
                if(etNamaLengkap.getText().toString().isEmpty()){
                    layoutNamaLengkap.setError("Nama lengkap harus diisi");
                }else if(etEmail.getText().toString().isEmpty()){
                    layoutEmail.setError("Email harus diisi");
                }else if(etNomorHp.getText().toString().isEmpty()){
                    layoutNomorHp.setError("Nomor Handphone harus diisi");
                }else if(etPassword.getText().toString().isEmpty()){
                    layoutPassword.setError("Kata Sandi harus diisi");
                }else if(etTanggalLahir.getText().toString().isEmpty()){
                    layoutTanggalLahir.setError("Tanggal Lahir harus diisi");
                }else {
                    int selectedId = radioGroupJenisKelamin.getCheckedRadioButtonId();
                    radioButtonJenisKelamin = (RadioButton) findViewById(selectedId);

                    <#if useApi>
                    mPresenter.doSubmit${activityClass}(<#if auth == 'basic'>"Basic " + Base64.encodeToString(("${basicUserPassword}").getBytes(),Base64.DEFAULT)</#if><#if auth == 'bearer'>"Bearer "+ Base64.encodeToString(("${bearerToken}").getBytes(),Base64.DEFAULT)</#if>,new ${activityClass}Request(etNamaLengkap.getText().toString(),etEmail.getText().toString(),etPassword.getText().toString(),etNomorHp.getText().toString(),etTanggalLahir.getText().toString(),radioButtonJenisKelamin.getText().toString(),spnAgama.getSelectedItem().toString()));
                    </#if>
                    <#if !useApi>
                    getDialog().showDialog("SUBMIT BERHASIL","Pendaftaran yang anda lakukan telah berhasil, silahkan cek email atau nomor hp anda");
                    </#if>

                }
            }
        });

    }

    private void updateLabel() {
        String myFormat = "dd MMM yyyy"; //In which you need put here
        SimpleDateFormat sdf = new SimpleDateFormat(myFormat, Locale.US);

        etTanggalLahir.setText(sdf.format(myCalendar.getTime()));
    }

    <#if useApi>
    @Override
    public void onSuccessSubmit${activityClass}(${activityClass}Response response) {
        Log.d("RESPONSE", new SahabatHelper<${activityClass}Response>().convertModelToJson(response));
        getDialog().showDialog("SUBMIT BERHASIL","Pendaftaran yang anda lakukan telah berhasil, silahkan cek email atau nomor hp anda");

    }
    </#if>

    @Override
    public void onMessage(String s) {
        getUserInterface().showMessageToast(s);
    }

    @Override
    public void onShowProgressDialog() {
        getLoading().showLoadingDialog();
    }

    @Override
    public void onHideProgressDialog() {
        getLoading().hideLoadingDialog();
    }

    <#if isToolbarBack>
    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if(item.getItemId()==android.R.id.home){
            onBackPressed();
        }

        return super.onOptionsItemSelected(item);
    }
    </#if>

}
