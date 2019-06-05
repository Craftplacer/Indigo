/*
 * Scratch Project Editor and Player
 * Copyright (C) 2014 Massachusetts Institute of Technology
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

// ListPrimitives.as
// John Maloney, September 2010
//
// List primitives.

package primitives {
	import blocks.Block;
	import interpreter.Interpreter;
	import flash.utils.Dictionary;
	import scratch.ScratchObj;
	import flash.events.Event;
	import flash.net.*;
	import flash.geom.*;

public class MorePrims {

	private var app:Scratch;
	protected var interp:Interpreter;

	public function MorePrims(app:Scratch, interpreter:Interpreter) {
		this.app = app;
		this.interp = interpreter;
	}

	public function addPrimsTo(primTable:Dictionary):void {
		primTable["setTurboMode"]	= primSetTurboMode;
		primTable["setStageSize"]	= primSetStageSize;
		primTable["setFrameRate"]	= primSetFramerate;
		primTable["showFrameRateReadout"]	= primShowFramerateReadout;
	}



	public function primSetTurboMode(b:*):*{
		interp.turboMode = app.interp.arg(b, 0);
		app.stagePart.refresh();
	}
	public function primSetStageSize(b:*):*{
		//Set Stage Size
		ScratchObj.STAGEW = app.interp.arg(b, 0);
		ScratchObj.STAGEH = app.interp.arg(b, 1);
		//Set Render Clip
		app.stagePane.scrollRect = new Rectangle(0, 0, ScratchObj.STAGEW, ScratchObj.STAGEH); // clip drawing to my bounds
		app.stagePane.resetPenLayer();
		//Refresh various parts of the UI
		app.onResize(null);
		app.refreshStagePart();
		app.fixLayout();
	}
	public function primSetFramerate(b:*):*{
		if (app.interp.arg(b,0) < 1000)
		{
				app.stage.frameRate = app.interp.arg(b,0);
		}


	}
	public function primShowFramerateReadout(b:*):*{
		app.addFrameRateReadout(0,0);
	}
}}
