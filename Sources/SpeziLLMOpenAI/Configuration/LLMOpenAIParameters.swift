// ... existing code ...
    public enum ModelType: Sendable, Equatable {
        // swiftlint:disable identifier_name

        // GPT-4 series
        case gpt4o
        case gpt4o_mini
        case gpt4_turbo

        // o-series
        case o3_mini
        case o3_mini_high
        case o1
        case o1_mini

        // Others
        case gpt3_5_turbo

        // Custom model string
        case custom(String)
        // swiftlint:enable identifier_name

        public var rawValue: String {
            switch self {
            case .gpt4o: return "gpt-4o"
            case .gpt4o_mini: return "gpt-4o-mini"
            case .gpt4_turbo: return "gpt-4-turbo"
            case .o3_mini: return "o3-mini"
            case .o3_mini_high: return "o3-mini-high"
            case .o1: return "o1"
            case .o1_mini: return "o1-mini"
            case .gpt3_5_turbo: return "gpt-3.5-turbo"
            case .custom(let value): return value
            }
        }
        
        public init(rawValue: String) {
            switch rawValue {
            case "gpt-4o": self = .gpt4o
            case "gpt-4o-mini": self = .gpt4o_mini
            case "gpt-4-turbo": self = .gpt4_turbo
            case "o3-mini": self = .o3_mini
            case "o3-mini-high": self = .o3_mini_high
            case "o1": self = .o1
            case "o1-mini": self = .o1_mini
            case "gpt-3.5-turbo": self = .gpt3_5_turbo
            default: self = .custom(rawValue)
            }
        }
    }
// ... existing code ...
    public init(
        modelType: ModelType,
        systemPrompt: String? = Defaults.defaultOpenAISystemPrompt,
        modelAccessTest: Bool = false,
        overwritingToken: String? = nil
    ) {
        self.init(
            modelType: modelType.rawValue,
            systemPrompts: systemPrompt.map { [$0] } ?? [],
            modelAccessTest: modelAccessTest,
            overwritingToken: overwritingToken
        )
    }
// ... existing code ...
