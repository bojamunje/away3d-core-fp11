package away3dGold.animators.transitions
{
	import away3dGold.animators.nodes.*;
	
	/**
	 * A skeleton animation node that uses two animation node inputs to blend a lineraly interpolated output of a skeleton pose.
	 */
	public class CrossfadeTransitionNode extends SkeletonBinaryLERPNode
	{
		public var blendSpeed:Number;
		
		public var startBlend:int;
		
		/**
		 * Creates a new <code>CrossfadeTransitionNode</code> object.
		 */
		public function CrossfadeTransitionNode()
		{
			_stateClass = CrossfadeTransitionState;
		}
	}
}
