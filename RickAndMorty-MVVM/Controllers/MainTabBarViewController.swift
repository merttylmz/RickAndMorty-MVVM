//
//  ViewController.swift
//  RickAndMorty-MVVM
//
//  Created by Mert Yılmaz on 9.09.2024.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        createTabBar()
    }

    private func createTabBar(){
        let charactersTab = UINavigationController(rootViewController: CharacterViewController())
        let locationsTab = UINavigationController(rootViewController: LocationViewController())
        let episodesTab = UINavigationController(rootViewController: EpisodesViewController())
        let settingsTab = UINavigationController(rootViewController: SettingsViewController())

        charactersTab.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
        locationsTab.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
        episodesTab.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
        settingsTab.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)

        setViewControllers([charactersTab,locationsTab,episodesTab,settingsTab], animated: true)
    }

}

