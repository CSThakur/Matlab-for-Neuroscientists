function c = get_spike_crossings(dataset, threshold)
  % verify that dataset is a vector
  dataset_size = size(dataset);
  if (dataset_size(1) < dataset_size(2))
    dataset = dataset';
  end

  c = []
  stop_threshold = 2;
 
  above_threshold = find(dataset >= threshold);
  gaps = find(diff(above_threshold) >= stop_threshold);

  % add the end of the sequence
  gaps = [gaps; length(above_threshold)];

  threshold_start = 1
  for gap = 1:length(gaps)
    threshold_end = gaps(gap);

    spike_start = above_threshold(threshold_start);
    spike_end   = above_threshold(threshold_end);
    spike = dataset(spike_start:spike_end);
    peak = find(spike == max(spike));
    c = [c; peak(1)+spike_start-1];
    threshold_start = threshold_end + 1;
  end

