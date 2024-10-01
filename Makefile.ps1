# Makefile.ps1

# 환경 변수 설정
$env:CUDA_DEVICE_ORDER = "PCI_BUS_ID"
$env:CUDA_VISIBLE_DEVICES = "0"

# 기본 설정 파일 경로
$BASE = "base/cifar100_order1.yaml"

# 직접 python 명령을 호출하여 출력(stdout)과 오류(stderr)를 모두 하나의 파일에 리디렉션(2>&1)하도록 수정
# vit_adapter 작업
function vit_adapter {
    Write-Host "Running vit_adapter..."
    python main.py --config=vit_adapter extends="[$BASE]" > vit_adapter.out 2>&1
}

# vit_lora 작업
function vit_lora {
    Write-Host "Running vit_lora..."
    python main.py --config=vit_lora extends="[$BASE]" > vit_lora.out 2>&1
}

# vit_prefix 작업
function vit_prefix {
    Write-Host "Running vit_prefix..."
    python main.py --config=vit_prefix extends="[$BASE]" > vit_prefix.out 2>&1
}

# swin_adapter 작업
function swin_adapter {
    Write-Host "Running swin_adapter..."
    python main.py --config=swin_adapter extends="[$BASE]" > swin_adapter.out 2>&1
}

# convnext_adapter 작업
function convnext_adapter {
    Write-Host "Running convnext_adapter..."
    python main.py --config=convnext_adapter extends="[$BASE]" > convnext_adapter.out 2>&1
}
