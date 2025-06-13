function is_near(a, b)
    return a.x < b.x + b.size * 4 and
           b.x < a.x + a.size * 4 and
           a.y < b.y + b.size * 4 and
           b.y < a.y + a.size * 4
end

return is_near