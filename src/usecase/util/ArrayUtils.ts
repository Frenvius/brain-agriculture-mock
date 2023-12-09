export class ArrayUtils {
	private static EMPTY_LENGTH = 0;

	public static isEmpty(array: any[]) {
		return array.length === ArrayUtils.EMPTY_LENGTH;
	}
}
