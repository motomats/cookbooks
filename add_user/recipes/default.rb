#
# Cookbook Name:: add_user
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
user "motomats" do
  comment "Motokatsu Matsui"
  uid 1000
  gid "users"
  home "/home/motomats"
  shell "/bin/bash"
end

directory "/home/motomats/.ssh" do
  owner "motomats"
  group "users"
  mode 0700
end

remote_file "/home/motomats/.ssh/authorized_keys" do
  owner "motomats"
  group "users"
  mode 0600
  source "http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key"
end
