require 'unsup'

function unsup.spectral_clustering(X, K, eps)
    -- args
    X = X or error('missing argument: '.. help)
    K = K or error('missing argument: '.. help)
    eps = eps or 1e-6
    assert(x:size(1) == x:size(2))
    
    -- compute the degree matrix D
    local D = torch.diag(torch.sum(x, 1):squeeze())
    
    -- compute thr random-walk normalized matrix L
    local D_safe = torch.diag(D) -- vectorized
    local divided = torch.Tensor(D_safe:size()):fill(eps + 1.0)
    local D_coef = torch.diag(torch.cdiv(divided, D_safe))
    
    local L = D - X
    L = D_coef * L
    
    -- solve the generalized eigen decomposition
    
end