package away3dGold.core.traverse
{
	import away3dGold.arcane;
	import away3dGold.core.base.IRenderable;
	import away3dGold.core.data.RenderableListItem;
	import away3dGold.entities.Entity;
	import away3dGold.lights.DirectionalLight;
	import away3dGold.lights.LightBase;
	import away3dGold.lights.LightProbe;
	import away3dGold.lights.PointLight;
	import away3dGold.materials.MaterialBase;

	use namespace arcane;


	/**
	 * The EntityCollector class is a traverser for scene partitions that collects all scene graph entities that are
	 * considered potientially visible.
	 *
	 * @see away3dGold.partition.Partition3D
	 * @see away3dGold.partition.Entity
	 */
	public class ShadowCasterCollector extends EntityCollector
	{
		/**
		 * Creates a new EntityCollector object.
		 */
		public function ShadowCasterCollector()
		{
			super();
		}

		/**
		 * Adds an IRenderable object to the potentially visible objects.
		 * @param renderable The IRenderable object to add.
		 */
		override public function applyRenderable(renderable : IRenderable) : void
		{
			// the test for material is temporary, you SHOULD be hammered with errors if you try to render anything without a material
			var material : MaterialBase = renderable.material;
			var entity : Entity = renderable.sourceEntity;
			if (renderable.castsShadows && material) {
				var item : RenderableListItem = _renderableListItemPool.getItem();
				item.renderable = renderable;
				item.next = _opaqueRenderableHead;
				item.cascaded = false;
				var dx : Number = _entryPoint.x - entity.x;
				var dy : Number = _entryPoint.y - entity.y;
				var dz : Number = _entryPoint.z - entity.z;
				item.zIndex = dx*_cameraForward.x + dy*_cameraForward.y + dz*_cameraForward.z;
				item.renderSceneTransform = renderable.getRenderSceneTransform(_camera);
				item.renderOrderId = material._depthPassId;
				_opaqueRenderableHead = item;
			}
		}

		override public function applyUnknownLight(light : LightBase) : void {}
		override public function applyDirectionalLight(light : DirectionalLight) : void {}
		override public function applyPointLight(light : PointLight) : void {}
		override public function applyLightProbe(light : LightProbe) : void {}
		override public function applySkyBox(renderable : IRenderable) : void {}
	}
}