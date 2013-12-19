////////////////////////////////////////////////////////////////////////////////
//
//  Licensed to the Apache Software Foundation (ASF) under one or more
//  contributor license agreements.  See the NOTICE file distributed with
//  this work for additional information regarding copyright ownership.
//  The ASF licenses this file to You under the Apache License, Version 2.0
//  (the "License"); you may not use this file except in compliance with
//  the License.  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
////////////////////////////////////////////////////////////////////////////////
package org.apache.flex.ant.tags
{
    import flash.events.Event;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    
    import mx.core.IFlexModuleFactory;
    
    import org.apache.flex.ant.Ant;
    import org.apache.flex.ant.tags.supportClasses.TaskHandler;
    import org.apache.flex.xml.ITagHandler;
    
    [Mixin]
    public class Replace extends TaskHandler
    {
        public static function init(mf:IFlexModuleFactory):void
        {
            Ant.antTagProcessors["replace"] = Replace;
        }

        public function Replace()
        {
            super();
        }
        
        private var file:String;
        private var token:String;
        private var value:String;
        
        override protected function processAttribute(name:String, value:String):void
        {
            if (name == "file")
                file = value;
            else if (name == "token")
                token = value;
            else if (name == "value")
                this.value = value;
            else
                super.processAttribute(name, value);
        }
        
        override public function execute(callbackMode:Boolean, context:Object):Boolean
        {
            super.execute(callbackMode, context);

            var f:File = File.applicationDirectory.resolvePath(file);
            var fs:FileStream = new FileStream();
            fs.open(f, FileMode.READ);
            var s:String = fs.readUTFBytes(fs.bytesAvailable);
            fs.close();
            var regex:RegExp = new RegExp(token, "g");
            s = s.replace(regex, value);
            fs.open(f, FileMode.WRITE);
            fs.writeUTFBytes(s);
            fs.close();
            return true;
        }
   }
}