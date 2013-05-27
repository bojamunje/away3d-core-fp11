package away3dGold.animators.states
{
	import away3dGold.animators.data.*;
	
	public interface ISkeletonAnimationState extends IAnimationState
	{
		/**
		 * Returns the output skeleton pose of the animation node.
		 */
		function getSkeletonPose(skeleton:Skeleton):SkeletonPose;
	}
}
