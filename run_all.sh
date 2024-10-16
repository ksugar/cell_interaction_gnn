#!/bin/bash

# Step 1: Preprocessing
echo "Starting Preprocessing..."
cd /workspace/analysis/1.preprocessing/simulation/del-div/preprocessing_batch
python run_preprocessing.py
echo "Preprocessing complete."

# Step 2: Create spatio-temporal graphs and output target IDs
echo "Creating spatio-temporal graphs..."
cd /workspace/analysis/2.create_network/simulation/del-div/create_network_batch
python run_create_network.py
echo "Graph creation complete."

# Step 3: Extract subgraph information
echo "Extracting subgraph information..."
cd /workspace/analysis/2.create_network/simulation/del-div/extract_subnetwork_batch
python run_extract_subnetwork.py
echo "Subgraph extraction complete."

# Step 4: Train the GNN model
echo "Starting GNN model training..."
cd /workspace/analysis/3.training_attribution/simulation/del-div/feature_ZZFR
python run_training_parallel.py
echo "Model training complete."

# Step 5: Analyze the performance of the training
echo "Analyzing training performance..."
cd /workspace/analysis/3.training_attribution/simulation/del-div/feature_ZZFR/run_analyze_prediction_performance
python run_analyze_prediction_performance.py
echo "Performance analysis complete."

# Step 6: Calculate the attribution
echo "Calculating attribution..."
cd /workspace/analysis/3.training_attribution/simulation/del-div/feature_ZZFR/calculate_attribution_batch
python run_calculate_attribution.py
echo "Attribution calculation complete."

# Step 7: Pool attributions into feature types
echo "Pooling attributions..."
cd /workspace/analysis/3.training_attribution/simulation/del-div/feature_ZZFR/softmax_to_pool_attribution_batch
python run_softmax_to_pool_attribution.py
echo "Attribution pooling complete."

# Step 8: Plot the attribution
echo "Plotting attribution results..."
cd /workspace/analysis/3.training_attribution/simulation/del-div/feature_ZZFR/bar_plot_attribution_batch
python run_bar_plot_attribution.py
echo "Attribution plotting complete."

echo "All steps completed successfully."
