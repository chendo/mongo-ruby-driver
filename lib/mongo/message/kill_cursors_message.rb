# --
# Copyright (C) 2008-2009 10gen Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ++

require 'mongo/message/message'
require 'mongo/message/opcodes'

module Mongo

  class KillCursorsMessage < Message

    def initialize(*cursors)
      super(OP_KILL_CURSORS)
      write_int(0)
      write_int(cursors.length)
      cursors.each { |c| write_long c }
    end
  end
end
