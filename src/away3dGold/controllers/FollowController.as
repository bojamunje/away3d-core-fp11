package away3dGold.controllers
{
	import away3dGold.containers.ObjectContainer3D;
	import away3dGold.entities.Entity;
	
	
	/**
	 * Controller used to follow behind an object on the XZ plane, with an optional
	 * elevation (tiltAngle).
	 * 
	 * @see	away3dGold.containers.View3D
	 */
	public class FollowController extends HoverController
	{
		public function FollowController(targetObject:Entity = null, lookAtObject:ObjectContainer3D = null, tiltAngle : Number = 45, distance : Number = 700 ) 
		{
			super(targetObject, lookAtObject, 0, tiltAngle, distance);
		}
		
		override public function update(interpolate:Boolean = true):void 
		{
			interpolate = interpolate;// unused: prevents warning

			if (!lookAtObject)
				return;			
			
			panAngle = _lookAtObject.rotationY - 180;
			super.update();
		}		
	}
}