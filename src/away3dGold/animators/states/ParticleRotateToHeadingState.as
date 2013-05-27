package away3dGold.animators.states
{
	import away3dGold.animators.data.AnimationRegisterCache;
	import away3dGold.animators.data.AnimationSubGeometry;
	import away3dGold.animators.nodes.ParticleRotateToHeadingNode;
	import away3dGold.animators.nodes.ParticleNodeBase;
	import away3dGold.animators.ParticleAnimator;
	import away3dGold.cameras.Camera3D;
	import away3dGold.core.base.IRenderable;
	import away3dGold.core.managers.Stage3DProxy;
	import flash.geom.Matrix3D;
	
	import away3dGold.arcane;
	use namespace arcane;
	/**
	 * ...
	 */
	public class ParticleRotateToHeadingState extends ParticleStateBase
	{
		
		private var _matrix:Matrix3D = new Matrix3D;
		
		public function ParticleRotateToHeadingState(animator:ParticleAnimator, particleNode:ParticleNodeBase)
		{
			super(animator, particleNode);
		}
		
		override public function setRenderState(stage3DProxy:Stage3DProxy, renderable:IRenderable, animationSubGeometry:AnimationSubGeometry, animationRegisterCache:AnimationRegisterCache, camera:Camera3D) : void
		{
			if (animationRegisterCache.hasBillboard)
			{
				_matrix.copyFrom( renderable.sceneTransform);
				_matrix.append(camera.inverseSceneTransform);
				animationRegisterCache.setVertexConstFromMatrix(animationRegisterCache.getRegisterIndex(_animationNode, ParticleRotateToHeadingNode.MATRIX_INDEX), _matrix);
			}
		}
		
	}

}