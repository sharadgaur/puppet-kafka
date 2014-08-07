# == Class kafka::mirror::install
#
# This private class installs a kafka mirror service
#
class kafka::mirror::install {

  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  if !defined(Class['::kafka']) {
    class { '::kafka':
      version       => $kafka::mirror::version,
      scala_version => $kafka::mirror::scala_version,
      install_dir   => $kafka::mirror::install_dir,
      mirror_url    => $kafka::mirror::mirror_url,
      install_java  => $kafka::mirror::install_java,
      package_dir   => $kafka::mirror::package_dir
    }
  }
}
