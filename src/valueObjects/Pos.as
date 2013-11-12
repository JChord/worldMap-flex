package valueObjects {
	[Bindable]
	public class Pos {
		public var x:Number;
		public var y:Number;
		public function Pos(x:Number, y:Number) {
			this.x = x;
			this.y = y;
		}
	}
}