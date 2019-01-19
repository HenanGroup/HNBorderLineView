//
//  UIView+Extension.swift
//  HNBorderLineView
//
//  Created by guowk on 2018/10/24.
//
import UIKit

public extension UIView {
    
    
    /// 给UIView及其子类添加分隔线
    ///
    /// - Parameters:
    ///   - directions: 分隔线方向
    ///   - configClosure: 分隔线的配置
    public func addSeparatorLines(_ directions: [SeparatorView.SeparatorDirection], configClosure: SeparatorView.SeparatorConfigClosure? = nil) {
        directions.forEach {
            addSeparator($0, configClosure: configClosure)
        }
    }
    
    fileprivate func addSeparator(_ direction: SeparatorView.SeparatorDirection, configClosure: SeparatorView.SeparatorConfigClosure?) {
        let lineView = SeparatorView()
        lineView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineView)
        
        configClosure?(lineView, direction)
        lineView.backgroundColor = lineView.defaultConfig.color
        lineView.direct = direction
        
        switch direction {
        case .left:
            if #available(iOS 9.0, *) {
                lineView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
                lineView.widthAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
                lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
                lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            }
            else {
                addConstraints([
                    NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: lineView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: lineView.defaultConfig.height),
                    NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: lineView.defaultConfig.insets.frond),
                    NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -lineView.defaultConfig.insets.back)
                    ])
            }
            break
        case .right:
            if #available(iOS 9.0, *) {
                lineView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
                lineView.widthAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
                lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
                lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            }
            else {
                addConstraints([
                    NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: lineView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: lineView.defaultConfig.height),
                    NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: lineView.defaultConfig.insets.frond),
                    NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -lineView.defaultConfig.insets.back)
                    ])
            }
            break
        case .top:
            if #available(iOS 9.0, *) {
                lineView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
                lineView.heightAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
                lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
                lineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            }
            else {
                addConstraints([
                    NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: lineView.defaultConfig.height),
                    NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: lineView.defaultConfig.insets.frond),
                    NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -lineView.defaultConfig.insets.back)
                    ])
            }
            break
        case .bottom:
            if #available(iOS 9.0, *) {
                lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                lineView.heightAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
                lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
                lineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            }
            else {
                addConstraints([
                    NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: lineView.defaultConfig.height),
                    NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: lineView.defaultConfig.insets.frond),
                    NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -lineView.defaultConfig.insets.back)
                    ])
            }
            break
        case .centerX:
            if #available(iOS 9.0, *) {
                lineView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                lineView.widthAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
                lineView.topAnchor.constraint(equalTo: self.topAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
                lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            }
            else {
                addConstraints([
                    NSLayoutConstraint(item: lineView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: lineView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: lineView.defaultConfig.height),
                    NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: lineView.defaultConfig.insets.frond),
                    NSLayoutConstraint(item: lineView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: -lineView.defaultConfig.insets.back)
                    ])
            }
            break
        case .centerY:
            if #available(iOS 9.0, *) {
                lineView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                lineView.heightAnchor.constraint(equalToConstant: lineView.defaultConfig.height).isActive = true
                lineView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: lineView.defaultConfig.insets.frond).isActive = true
                lineView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -lineView.defaultConfig.insets.back).isActive = true
            }
            else {
                addConstraints([
                    NSLayoutConstraint(item: lineView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0),
                    NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: lineView.defaultConfig.height),
                    NSLayoutConstraint(item: lineView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: lineView.defaultConfig.insets.frond),
                    NSLayoutConstraint(item: lineView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: -lineView.defaultConfig.insets.back)
                    ])
            }
            break
        default:
            break
        }
        
    }
    
    
    /// 移除所有分隔线
    public func removeAllSeparatorLine() {
        subviews.compactMap { $0 as? SeparatorView }
            .forEach { $0.removeFromSuperview() }
    }
    
    /// 移除分隔线
    ///
    /// - Parameter directions: 被移除分隔线的方向
    public func removeSeparatorLine(_ directions: [SeparatorView.SeparatorDirection]) {
        let directSet = Set(directions)
        subviews.compactMap { $0 as? SeparatorView }
            .filter { directSet.contains($0.direct) }
            .forEach { $0.removeFromSuperview() }
    }
}

public struct SeparatorInsets {
    public var frond: CGFloat
    public var back: CGFloat
    
    public static func zero() -> SeparatorInsets {
        return SeparatorInsets(frond: 0, back: 0)
    }
    
    public init(frond: CGFloat, back: CGFloat) {
        self.frond = frond
        self.back = back
    }
}

public struct SeparatorConfig {
    public var insets: SeparatorInsets = .zero()
    public var color: UIColor = .groupTableViewBackground
    public var height: CGFloat = 1.0
}

public final class SeparatorView: UIView {
    public typealias SeparatorConfigClosure = (SeparatorView, SeparatorView.SeparatorDirection) -> Void

    /// 分隔线配置
    public var defaultConfig: SeparatorConfig = SeparatorConfig()
    
    
    /// 分隔线方向
    ///
    /// - none: 不添加分隔线
    /// - left: 左
    /// - right: 右
    /// - top: 上
    /// - bottom: 下
    /// - centerX: 水平中间
    /// - centerY: 垂直中间
    public enum SeparatorDirection {
        case none
        case left
        case right
        case top
        case bottom
        case centerX
        case centerY
    }
    
    fileprivate var direct: SeparatorDirection = .none
}
