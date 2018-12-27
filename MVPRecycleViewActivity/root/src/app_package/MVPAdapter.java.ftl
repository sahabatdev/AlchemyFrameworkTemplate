package ${packageName}.module.${activityPackage};

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import ${packageName}.R;
import ${packageName}.model.${activityPackage}.${activityClass}Response;

import java.util.List;

public class ${activityClass}Adapter extends RecyclerView.Adapter<${activityClass}Adapter.ViewHolder> {
    List<${activityClass}Response> list${activityClass};
    Context context;

    public ${activityClass}Adapter(Context context, List<${activityClass}Response> list${activityClass}) {
        this.list${activityClass} = list${activityClass};
        this.context = context;
    }

    @NonNull
    @Override
    public ${activityClass}Adapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        return new ViewHolder(LayoutInflater.from(context).inflate(R.layout.item_list_${activityPackage}, parent, false));
    }

    @Override
    public void onBindViewHolder(@NonNull ${activityClass}Adapter.ViewHolder holder, int position) {
        ${activityClass}Response response = list${activityClass}.get(position);
        holder.tvTitle.setText(response.getTitle());
        holder.tvDeskripsi.setText(response.getDescription());
    }

    @Override
    public int getItemCount() {
        return list${activityClass}.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView tvTitle, tvDeskripsi;

        public ViewHolder(View itemView) {
            super(itemView);
            tvTitle = itemView.findViewById(R.id.tv_title);
            tvDeskripsi = itemView.findViewById(R.id.tv_deskripsi);
        }

    }
}
