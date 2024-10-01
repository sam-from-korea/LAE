# -*- coding: utf-8 -*-

from typing import Optional

import torch
import torch.nn as nn


class Scaler(nn.Module):
    def __init__(self, scale: Optional[float] = None):
        super().__init__()

        if scale is None:
            self.register_parameter("scale", nn.Parameter(torch.tensor(1.0)))
        else:
            self.scale = scale

    def forward(self, input):
        return input * self.scale

    """def extra_repr(self):
        learnable = isinstance(self.scale, nn.Parameter)
        return f"scale={self.scale:.4f}, learnable={learnable}"""
    # self.scale이 torch.Tensor 또는 torch.nn.Parameter 객체일 경우 바로 포매팅을 시도
    # TypeError: unsupported format string passed to Parameter.__format__
    # =>
    def extra_repr(self):
        learnable = isinstance(self.scale, nn.Parameter)
        # self.scale이 텐서일 경우 .item()으로 숫자 값을 가져옴
        scale_value = self.scale.item() if isinstance(self.scale, torch.Tensor) else self.scale
        return f"scale={scale_value:.4f}, learnable={learnable}"
