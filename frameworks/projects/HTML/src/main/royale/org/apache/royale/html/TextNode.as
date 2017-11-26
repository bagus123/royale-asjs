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
package org.apache.royale.html
{
	import org.apache.royale.core.ContainerBase;

    COMPILE::JS
    {
        import org.apache.royale.core.WrappedHTMLElement;            
    }

    [DefaultProperty("text")]

	/**
	 *  The TextNode class represents an HTML Text node element
     *  
	 *  
     *  @toplevel
	 *  @langversion 3.0
	 *  @playerversion Flash 10.2
	 *  @playerversion AIR 2.6
	 *  @productversion Royale 0.0
	 */
	public class TextNode extends ContainerBase
	{
		/**
		 *  constructor.
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.0
		 */
		public function TextNode()
		{
			super();
		}
		
        private var _text:String = "";

        /**
         *  The text of the heading
         *  
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.0
         */
		public function get text():String
		{
			COMPILE::SWF
			{
	            return _text;
			}
			COMPILE::JS
			{
	            return element ? element.nodeValue : _text;
			}
		}

		public function set text(value:String):void
		{
            _text = value;

			COMPILE::JS
			{
				if(element)
                	element.nodeValue = value;
			}

		}
		
        COMPILE::JS
        override protected function createElement():WrappedHTMLElement
        {
			//We're actually lying a bit about the type considering that Text
			// inherits from CharacterData and not HTMLElement, but the important
			// bit from our perspective is that it's a Node and has a royale_wrapper.
			element = document.createTextNode(_text) as WrappedHTMLElement;
            return element;
        }
    }
}
