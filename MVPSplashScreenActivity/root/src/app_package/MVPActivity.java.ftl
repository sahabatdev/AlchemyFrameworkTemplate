package ${packageName}.module.${activityPackage};

import ${packageName}.R;
import android.os.Bundle;
import site.sahabatdeveloper.sahabatlibrary.base.BaseActivity;

public class ${activityClass}Activity extends BaseActivity implements ${activityClass}View{

    private int SPLASH_TIME = 2000;
    ${activityClass}Presenter mPresenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.${layoutName});

        getSupportActionBar().hide();

        mPresenter = new ${activityClass}Presenter(this);

        Thread timer = new Thread() {
            public void run() {
                try {
                    sleep(SPLASH_TIME);
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    /* TODO intent page after 2000 milisecond
                        getCommunication().moveActivity(HomeActivity.class);
                    */
                }
            }
        };
        timer.start();
    }

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

}
