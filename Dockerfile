# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail comfyui-custom-scripts@1.2.5
RUN comfy node install --exit-on-fail comfyui-supir@1.0.2
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511111955
RUN comfy node install --exit-on-fail comfyui-easy-use@1.3.4
RUN comfy node install --exit-on-fail comfyui-wd14-tagger@1.0.1
RUN comfy node install --exit-on-fail comfyui-florence2@1.0.6

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Kijai/SUPIR_pruned/resolve/main/SUPIR-v0Q_fp16.safetensors --relative-path models/checkpoints --filename SUPIR-v0Q_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Kijai/SUPIR_pruned/resolve/main/SUPIR-v0F_fp16.safetensors --relative-path models/checkpoints --filename SUPIR-v0F_fp16.safetensors
RUN comfy model download --url https://huggingface.co/Maxivi/SDXLLightning/blob/main/jibMixRealisticXL_v10Lightning46Step.safetensors --relative-path models/checkpoints --filename jibMixRealisticXL_v10Lightning46Step.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
