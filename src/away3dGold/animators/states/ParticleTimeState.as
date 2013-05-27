package away3dGold.animators.states
{
	import away3dGold.arcane;
	import away3dGold.cameras.Camera3D;
	import away3dGold.animators.data.AnimationRegisterCache;
	import away3dGold.animators.data.AnimationSubGeometry;
	import away3dGold.core.base.IRenderable;
	import away3dGold.core.managers.Stage3DProxy;
	import away3dGold.animators.nodes.ParticleTimeNode;
	import away3dGold.animators.ParticleAnimator;
	import flash.display3D.Context3DVertexBufferFormat;
	
	use namespace arcane;
	
	/**
	 * ...
	 */
	public class ParticleTimeState extends ParticleStateBase
	{
		private var _particleTimeNode:ParticleTimeNode;
		
		public function ParticleTimeState(animator:ParticleAnimator, particleTimeNode:ParticleTimeNode)
		{
			super(animator, particleTimeNode, true);
			
			_particleTimeNode = particleTimeNode;
		}
		
		override public function setRenderState(stage3DProxy:Stage3DProxy, renderable:IRenderable, animationSubGeometry:AnimationSubGeometry, animationRegisterCache:AnimationRegisterCache, camera:Camera3D):void
		{
			animationSubGeometry.activateVertexBuffer(animationRegisterCache.getRegisterIndex(_animationNode, ParticleTimeNode.TIME_STREAM_INDEX), _particleTimeNode.dataOffset, stage3DProxy, Context3DVertexBufferFormat.FLOAT_4);
			
			var particleTime:Number = _time / 1000;
			animationRegisterCache.setVertexConst(animationRegisterCache.getRegisterIndex(_animationNode, ParticleTimeNode.TIME_CONSTANT_INDEX), particleTime, particleTime, particleTime, particleTime);
		}
		
	}

}