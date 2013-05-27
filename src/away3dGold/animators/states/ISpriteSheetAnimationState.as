package away3dGold.animators.states
{
	import away3dGold.animators.data.*;
	
	/**
	 * Provides an interface for animation node classes that hold animation data for use in the SpriteSheetAnimator class.
	 * 
	 * @see away3dGold.animators.SpriteSheetAnimator
	 */
	public interface ISpriteSheetAnimationState extends IAnimationState
	{
		/**
		 * Returns the current SpriteSheetAnimationFrame of animation in the clip based on the internal playhead position.
		 */
		function get currentFrameData() : SpriteSheetAnimationFrame;
		
		/**
		 * Returns the current frame number.
		 */
		function get currentFrameNumber() : uint;
		
	}
}