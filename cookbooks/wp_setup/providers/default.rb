def whyrun_supported?
  true
end

action :extract do

  if ::File.exists?("#{new_resource.wp_path}/wordpress")
    Chef::Log.info "#{new_resource} already exists - nothing to do."
    new_resource.updated_by_last_action(false)
  else
    converge_by("Downloading wordpress file") do
      directory "/var/www" do
        action :create
      end
      remote_file "#{new_resource.wp_path}/wordpress.tar.gz" do
        source "#{new_resource.wp_url}"
        action :create
      end

      bash "extracting wordpress" do
        code <<-EOH
        cd /var/www
        mkdir wordpress
        tar -xvf wordpress.tar.gz wordpress
        EOH
      end
    end

    new_resource.updated_by_last_action(true)
  end
end

action :remove do

  unless ::File.exists?("#{new_resource.wp_path}/wordpress.tar.gz")
    Chef::Log.info "#{new_resource} file deleted - nothing to do"
    new_resource.updated_by_last_action(false)
  else
    converge_by("removing the compressed wordpress file ") do
      file "#{new_resource.wp_path}/wordpress.tar.gz" do
        action :delete
      end

      directory "/root/chefdemo" do
        action :create
      end
    end

    new_resource.updated_by_last_action(true)
  end
end