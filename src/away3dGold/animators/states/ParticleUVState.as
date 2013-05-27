package away3dGold.animators.states
{
	import flash.geom.Vector3D;
	import away3dGold.arcane;
	import away3dGold.cameras.Camera3D;
	import away3dGold.animators.data.AnimationRegisterCache;
	import away3dGold.animators.data.AnimationSubGeometry;
	import away3dGold.core.base.IRenderable;
	import away3dGold.core.managers.Stage3DProxy;
	import away3dGold.animators.nodes.ParticleUVNode;
	import away3dGold.animators.ParticleAnimator;
	
	use namespace arcane;
	
	/**
	 * ...
	 */
	public class ParticleUVState extends ParticleStateBase
	{
		
		private var _particleUVNode:ParticleUVNode;

		public function ParticleUVState(animator:ParticleAnimator, particleUVNode:ParticleUVNode)
		{
			super(animator, particleUVNode);
			
			_particleUVNode = particleUVNode;
		}
		
		
		override public function setRenderState(stage3DProxy:Stage3DProxy, renderable:IRenderable, animationSubGeometry:AnimationSubGeometry, animationRegisterCache:AnimationRegisterCache, camera:Camera3D):void
		{
			if (animationRegisterCache.needUVAnimation)
			{
				var index:int = animationRegisterCache.getRegisterIndex(_animationNode, ParticleUVNode.UV_INDEX);
				var data:Vector3D = _particleUVNode._uvData;
				animationRegisterCache.setVertexConst(index, data.x, data.y);
			}
		}
	
	}

}