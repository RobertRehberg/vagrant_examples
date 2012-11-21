maintainer  "BAD"
description "Test vagrant"
version     "0.0.1"

supports 'ubuntu'

recipe 'hello::default', 'Tests setting inputs'

attribute 'hello/world',
          :display_name => 'world',
          :recipes => ['hello::default']