function plot_cwt(t, scale_density, scales)
    imagesc(t, scales, scale_density);
    colormap(jet);
    axis xy;
end