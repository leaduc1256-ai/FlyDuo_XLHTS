function q = evalQuality(I_clean, I_enh)
% EVALQUALITY Tinh PSNR va SSIM giua anh sach va anh sau loc
% I_clean, I_enh: anh xam, kieu double, thang [0, 1]

    I_clean = double(I_clean);
    I_enh   = double(I_enh);

    if ~isequal(size(I_clean), size(I_enh))
        error('evalQuality: hai anh phai cung kich thuoc');
    end

    mse = mean((I_clean(:) - I_enh(:)).^2);
    if mse == 0
        q.psnr = Inf;
    else
        q.psnr = 10 * log10(1 / mse);
    end

    q.ssim = ssim(I_enh, I_clean);
end
