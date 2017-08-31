# Configure most
class profile::most {

  file { "/home/$::id/.mostrc":
    content => "setkey 'up' 'k'\nsetkey 'down' 'j'\nsetkey 'column_left' 'h'\nsetkey 'column_right' 'l'\n",
  }

}
