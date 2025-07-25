local function MergeSort(Table: { number }): { number }
	local Size = #Table

	if Size <= 1 then
		return Table
	end

	local Left = {}
	local Right = {}

	local MiddleIndex = Size // 2

	for i = 1, MiddleIndex do
		table.insert(Left, Table[i])
	end

	for i = MiddleIndex + 1, Size do
		table.insert(Right, Table[i])
	end

	Left = MergeSort(Left)
	Right = MergeSort(Right)
	
	--// Now merge left and right datasets

	local Merged = {}

	local LeftIndex = 1
	local RightIndex = 1
	local LeftSize = MiddleIndex
	local RightSize = Size - MiddleIndex

	while LeftIndex <= LeftSize and RightIndex <= RightSize do
		local LeftValue = Left[LeftIndex]
		local RightValue = Right[RightIndex]

		if LeftValue < RightValue then
			table.insert(Merged, LeftValue)
			LeftIndex += 1
		else
			table.insert(Merged, RightValue)
			RightIndex += 1
		end
	end

	while LeftIndex <= LeftSize do
		table.insert(Merged, Left[LeftIndex])
		LeftIndex += 1
	end

	while RightIndex <= RightSize do
		table.insert(Merged, Right[RightIndex])
		RightIndex += 1
	end

	return Merged
end
