use anyhow::Result;
use base64::{engine::general_purpose, Engine as _};
use cv::prelude::MatTraitConst;
use opencv::{self as cv};

const CANVAS_WIDTH_DEFAULT: i32 = 280;
pub fn captcha_solver(
    img_slider: String,
    img_background: String,
    canvas_width: Option<i32>,
) -> Result<f32> {
    let slider = canny_handle(base64_to_image(img_slider)?)?;
    let background_raw = base64_to_image(img_background)?;
    let background_width = background_raw.cols();
    let background = canny_handle(background_raw)?;
    let canvas_width = {
        match canvas_width {
            None => CANVAS_WIDTH_DEFAULT,
            Some(w) => w,
        }
    };

    let mut res = cv::core::Mat::default();
    cv::imgproc::match_template(
        &slider,
        &background,
        &mut res,
        cv::imgproc::TM_CCOEFF_NORMED,
        &cv::core::no_array(),
    )?;

    let mut max_loc = cv::core::Point::default();
    cv::core::min_max_loc(
        &res,
        None,
        None,
        None,
        Some(&mut max_loc),
        &cv::core::no_array(),
    )?;
    Ok(max_loc.x as f32 * canvas_width as f32 / background_width as f32)
}

fn canny_handle(image: cv::core::Mat) -> Result<cv::core::Mat> {
    let mut gaussian_res = cv::core::Mat::default();
    cv::imgproc::gaussian_blur(
        &image,
        &mut gaussian_res,
        cv::core::Size {
            width: 3,
            height: 3,
        },
        0.,
        0.,
        cv::core::BORDER_DEFAULT,
    )?;
    let mut canny_res = cv::core::Mat::default();
    cv::imgproc::canny(&gaussian_res, &mut canny_res, 50., 150., 3, false)?;
    Ok(canny_res)
}

fn base64_to_image(base64_code: String) -> Result<cv::core::Mat> {
    let image_data: cv::core::Vector<u8> = general_purpose::STANDARD.decode(base64_code)?.into();
    Ok(cv::imgcodecs::imdecode(
        &image_data,
        cv::imgproc::COLOR_RGB2BGR,
    )?)
}
