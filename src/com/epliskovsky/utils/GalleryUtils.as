/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.utils {

public class GalleryUtils {

    public static const INITIAL_IMAGE_COUNT:int = 20;

    private static const IMAGE_URL_PREFIX : String = "http://placeimg.com/";
    private static const IMAGE_URL_POSTFIX : String = "any";

    private static const MAX_IMAGE_INDEX:int = 100;
    private static const MIN_IMAGE_INDEX:int = 350;

    public function GalleryUtils() { }

    public static function generateRandomImageURL():String{
        return IMAGE_URL_PREFIX + generateRandomImageIndex(MIN_IMAGE_INDEX, MAX_IMAGE_INDEX) + "/" + generateRandomImageIndex(MIN_IMAGE_INDEX, MAX_IMAGE_INDEX) + "/" + IMAGE_URL_POSTFIX;
    }

    public static function getImageRotation():int {
        return 15 - Math.random() * 30;
    }

    private static function generateRandomImageIndex(min:int, max:int):int {
        return Math.round(Math.random()*(max - min) + min);
    }
}
}
