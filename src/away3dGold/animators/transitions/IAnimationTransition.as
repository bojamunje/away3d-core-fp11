package away3dGold.animators.transitions
{
	import away3dGold.animators.*;
	import away3dGold.animators.nodes.*;
	
	public interface IAnimationTransition
	{
		function getAnimationNode(animator:IAnimator, startNode:AnimationNodeBase, endNode:AnimationNodeBase, startTime:int):AnimationNodeBase
	}
}
