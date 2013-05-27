package away3dGold.core.partition
{
	import away3dGold.core.traverse.PartitionTraverser;
	import away3dGold.lights.DirectionalLight;

	/**
	 * LightNode is a space partitioning leaf node that contains a LightBase object.
	 */
	public class DirectionalLightNode extends EntityNode
	{
		private var _light : DirectionalLight;

		/**
		 * Creates a new LightNode object.
		 * @param light The light to be contained in the node.
		 */
		public function DirectionalLightNode(light : DirectionalLight)
		{
			super(light);
			_light = light;
		}

		/**
		 * The light object contained in this node.
		 */
		public function get light() : DirectionalLight
		{
			return _light;
		}

		/**
		 * @inheritDoc
		 */
		override public function acceptTraverser(traverser : PartitionTraverser) : void
		{
			if (traverser.enterNode(this)) {
				super.acceptTraverser(traverser);
				traverser.applyDirectionalLight(_light);
			}
		}
	}
}