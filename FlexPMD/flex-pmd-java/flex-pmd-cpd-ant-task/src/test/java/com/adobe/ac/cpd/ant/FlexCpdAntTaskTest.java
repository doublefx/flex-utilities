/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.adobe.ac.cpd.ant;

import java.io.File;

import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.FileSet;
import org.junit.Test;

import com.adobe.ac.pmd.FlexPmdTestBase;

public class FlexCpdAntTaskTest extends FlexPmdTestBase
{
   @Test
   public void testExecute()
   {
      final FlexCpdAntTask task = new FlexCpdAntTask();
      final FileSet set = new FileSet();
      final Project project = new Project();

      set.setDir( getTestDirectory() );
      task.setProject( project );
      task.addFileset( set );
      task.execute();
   }

   @Test
   public void testParameter()
   {
      final FlexCpdAntTask task = new FlexCpdAntTask();
      final String encodingValue = "encoding";
      final String desc = "desc";
      final int minimumTokenCountToBeSet = 10;
      final File outputFile = null;

      task.setDescription( desc );
      task.setEncoding( encodingValue );
      task.setOutputFile( outputFile );
      task.setMinimumTokenCount( minimumTokenCountToBeSet );
   }
}
